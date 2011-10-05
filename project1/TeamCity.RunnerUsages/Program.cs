using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;

namespace TeamCity.RunnerUsages
{
  
  public static class SuperFoo {
    public static string Sup {get { return "aaa"; } }
  }


  public class Program545
  {
    static int Main(string[] args)
    {
      Console.Out.WriteLine("Program to search usages of build runner in TeamCity config directory.");
      Console.Out.WriteLine(".exe runType path to config directory");

      var runType = args.ElementAtOrDefault(0);
      var config = args.ElementAtOrDefault(1);

      if (string.IsNullOrWhiteSpace(runType))
      {
        Console.Error.WriteLine("RunType is not specified");
        return 1;
      }
      if (string.IsNullOrWhiteSpace(config) || !Directory.Exists(config))
      {
        Console.Error.WriteLine("Config directory does not exists or not specified");
        return 1;
      }

      var result = new List<String>();

      foreach (var projDir in Directory.GetDirectories(config))
      {
        string projectName = Path.GetFileName(projDir);
        if (projectName == null || projectName.StartsWith("_")) continue;

        Console.Out.WriteLine("Checking project: {0}", projectName);

        var projectXml = Path.Combine(projDir, "project-config.xml");
        if (!File.Exists(projectXml))
        {
          Console.Out.WriteLine("\tproject-config.xml does not exist: {0}", projectXml);
          continue;
        }

        var doc = new XmlDocument();
        doc.Load(projectXml);

        var nodes =
          new[]
            {
              doc.SelectNodes("//template"),
              doc.SelectNodes("//build-type")
            }
            .SelectMany(x => x.Cast<XmlElement>())
            .Where(x =>
                     {
                       var list = x.SelectNodes("//runner[@type='" + runType + "']");
                       return list != null && list.Count > 0;
                     })
            .Select(x => new {Id = x.GetAttribute("id"), Name = x.GetAttribute("name"), Type = x.Name, Project = projectName})
            .ToArray();

        result.AddRange(nodes.Select(node => string.Format("Found: id={0}, project={3}, name={1}, type={2}", node.Id, node.Name, node.Type, node.Project)));
      }

      foreach (var line in result.Distinct())
      {
        Console.Out.WriteLine(line);
      }
      return 0;
    }
  }
}
