// Author: luzan

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class send_to_google_drive : MonoBehaviour
{
    public GameObject name;
    public GameObject email;
    public GameObject phone;

    private string name_input;
    private string email_input;
    private string phone_input;

    [SerializeField]
    private string BASE_URL = "GOOGLE FORM URL";

    IEnumerator Post(string name, string email, string phone)
    {
        WWWForm form = new WWWForm();
        form.AddField("entry.1673653496", name);
        form.AddField("entry.1422402232", email);
        form.AddField("entry.1022174842", phone);
        byte[] rawData = form.data;
        WWW www = new WWW(BASE_URL, rawData);
        yield return www;
    }

    public void Send()
    {
        name_input = name.GetComponent<InputField>().text;
        email_input = email.GetComponent<InputField>().text;
        phone_input = phone.GetComponent<InputField>().text;
        StartCoroutine(Post(name_input, email_input, phone_input));
    }
}
