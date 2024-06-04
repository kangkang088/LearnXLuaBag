require("Object")
require("SplitTools")
Json = require("JsonUtility")

GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas

TextAsset = CS.UnityEngine.TextAsset

Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2

UI = CS.UnityEngine.UI
Image = UI.Image
Button = UI.Button
Text = UI.Text
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect
UIBehaviour = CS.UnityEngine.EventSystems.UIBehaviour

Canvas = GameObject.Find("Canvas").transform

ABMgr = CS.ABMgr.GetInstance()
