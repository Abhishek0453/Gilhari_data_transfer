package org.student;

import org.json.JSONException;
import org.json.JSONObject;

import com.softwaretree.jdx.JDX_JSONObject;
public class JSON_Student extends JDX_JSONObject {

    public JSON_Student() {
        super();
    }

    public JSON_Student(JSONObject jsonObject) throws JSONException {
        super(jsonObject);
    }
}
