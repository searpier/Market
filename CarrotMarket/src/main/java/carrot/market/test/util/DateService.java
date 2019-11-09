package carrot.market.test.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateService {

	public static int diffDate(String dt) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date today = new Date();
			Date date = format.parse(dt);

			long diff = today.getTime() - date.getTime();

			long diffDays = diff / (24 * 60 * 60 * 1000);
			return (int) diffDays;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static int diffYear(String dt) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			Date today = new Date();
			Date date = format.parse(dt);

			Calendar calToday = Calendar.getInstance();
			calToday.setTime(today);
			Calendar calDate = Calendar.getInstance();
			calDate.setTime(date);

			int diffYear = calToday.get(Calendar.YEAR) - calDate.get(Calendar.YEAR);

			if (diffYear < 0) {
				diffYear = 0;
			}
			return diffYear;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
