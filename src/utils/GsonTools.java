package utils;

import com.google.gson.Gson;

public class GsonTools {
	 /*
	  銆�銆�     * Function銆�:   鐢熸垚JSON瀛楃涓�?
	  銆�銆�     * Param 銆�銆�:銆�  value     鎯宠杞崲鎴�?�SON瀛楃涓茬殑Object瀵硅�?
	 銆�銆�     * Retuen銆�銆�:   JSON瀛楃涓�?
	 銆�銆�     * Author銆�銆�:   鍗氬鍥�?-渚濇棫娣＄劧
	 銆�銆�     */
	    public static String createJsonString(Object value) {
	       Gson gson = new Gson();
	       String string = gson.toJson(value);
	       return string;
	    }
}
