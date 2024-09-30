package Utils;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConvertUtils {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public static Date convertStringToDate(String dateStr) {
        try {
            return DATE_FORMAT.parse(dateStr);
        } catch (ParseException e) {
            return null;
        }
    }

    public static BigDecimal convertStringToBigDecimal(String decimalStr) {
        if (decimalStr != null && !decimalStr.isEmpty()) {
            String sanitizedDecimalStr = decimalStr.replace(",", ".").trim();
            System.out.println(sanitizedDecimalStr);
            return new BigDecimal(sanitizedDecimalStr);
        }
        return null;
    }

    public static int convertStringToInt(String intStr) {
        try {
            return Integer.parseInt(intStr);
        } catch (NumberFormatException e) {
            return -1; // Default value in case of conversion failure
        }
    }

    public static float convertStringToFloat(String floatStr) {
        try {
            return Float.parseFloat(floatStr);
        } catch (NumberFormatException e) {
            return -1.0f; // Default value in case of conversion failure
        }
    }

}
