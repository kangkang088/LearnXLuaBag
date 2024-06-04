using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class LuaCopyEditor : Editor
{
    [MenuItem("XLua/AutoGenerateLuaToTxt")]
    public static void CopyLuaToTxt()
    {
        //找到所有Lua文件
        string path = Application.dataPath + "/Lua/";
        if (!Directory.Exists(path))
            return;
        string[] luaPaths = Directory.GetFiles(path, "*.lua");
        //拷贝复制
        //首先定义一个新路径
        string newPaht = Application.dataPath + "/LuaTxt/";
        if (!Directory.Exists(newPaht))
        {
            Directory.CreateDirectory(newPaht);
        }
        else
        {
            //拷贝前清空，确保每次都是最新的
            string[] oldFile = Directory.GetFiles(newPaht, "*.txt");
            for (int i = 0; i < oldFile.Length; i++)
            {
                File.Delete(oldFile[i]);
            }
        }
        List<string> newFileNames = new List<string>();
        string fileName = "";
        for (int i = 0; i < luaPaths.Length; i++)
        {
            fileName = newPaht + luaPaths[i].Substring(luaPaths[i].LastIndexOf("/") + 1) + ".txt";
            newFileNames.Add(fileName);
            File.Copy(luaPaths[i], fileName);
        }
        AssetDatabase.Refresh();

        //刷新过后再改指定包
        for (int i = 0; i < newFileNames.Count; i++)
        {
            AssetImporter importer = AssetImporter.GetAtPath(newFileNames[i].Substring(newFileNames[i].IndexOf("Asset")));
            if (importer != null)
            {
                importer.assetBundleName = "lua";
            }
        }
    }
}
