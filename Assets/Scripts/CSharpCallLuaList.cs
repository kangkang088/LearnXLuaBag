using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using XLua;

public static class CSharpCallLuaList
{
    [CSharpCallLua]
    public static List<Type> csharpCallLuaList = new List<Type>() { typeof(UnityAction<bool>) };
}
