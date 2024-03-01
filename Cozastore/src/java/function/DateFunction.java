/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package function;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;

/**
 *
 * @author Drag
 */
public class DateFunction {

    public String[] getLastWeek() {
        LocalDateTime today = LocalDateTime.now();
        LocalDateTime lastSunday = today.with(TemporalAdjusters.previous(java.time.DayOfWeek.SUNDAY)).with(LocalTime.of(23, 59, 59));
        LocalDateTime lastMonday = lastSunday.minusDays(6).with(LocalTime.of(0, 0, 0));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String lastMondaySqlDate = lastMonday.format(formatter);
        String lastSundaySqlDate = lastSunday.format(formatter);
        return new String[]{lastMondaySqlDate, lastSundaySqlDate};
    }

    
    
}
