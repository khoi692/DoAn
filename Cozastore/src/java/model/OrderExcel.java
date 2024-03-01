/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.SaleStatics;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.BuiltinFormats;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Nhat Anh
 */
public class OrderExcel {

    public static final int COLUMN_INDEX_ID = 0;
    public static final int COLUMN_INDEX_CUSTOMER_NAME = 1;
    public static final int COLUMN_INDEX_PHONE = 2;
    public static final int COLUMN_INDEX_ADDRESS = 3;
    public static final int COLUMN_INDEX_ORDER_TIME = 4;
    public static final int COLUMN_INDEX_STATUS = 5;
    public static final int COLUMN_INDEX_REVENUE = 6;
    public static final int COLUMN_INDEX_PROFIT = 7;

    public static final int COLUMN_INDEX_2_ORDERID = 0;
    public static final int COLUMN_INDEX_2_PRODUCTID = 1;
    public static final int COLUMN_INDEX_2_PRODUCT_NAME = 2;
    public static final int COLUMN_INDEX_2_COLOR = 3;
    public static final int COLUMN_INDEX_2_SIZE = 4;
    public static final int COLUMN_INDEX_2_ENTRY_PRICE = 5;
    public static final int COLUMN_INDEX_2_PRICE = 6;
    public static final int COLUMN_INDEX_2_QUANTITY = 7;

    private static CellStyle cellStyleFormatNumber = null;

    public static void writeExcel(List<SaleOrder> list, List<SaleOrderDetail> orderDetail, String excelFilePath) throws IOException {
        // Create Workbook
        Workbook workbook = getWorkbook(excelFilePath);

        // Create sheet
        Sheet sheet = workbook.createSheet("Order"); // Create sheet with sheet name
        Sheet sheet2 = workbook.createSheet("OrderDetail"); // Create sheet with sheet name
        int rowIndex = 0;
        int rowIndexSheetDetail = 0;

        // Write header
        writeHeader(sheet, rowIndex);
        writeHeader2(sheet2, rowIndexSheetDetail);
        
        // Write data
        rowIndex++;
        rowIndexSheetDetail++;
        
        for (SaleOrderDetail order : orderDetail) {
            // Create row
            Row row = sheet2.createRow(rowIndexSheetDetail);
            // Write data on row
            writeBook2(order, row);
            rowIndexSheetDetail++;
        }

        for (SaleOrder order : list) {
            // Create row
            Row row = sheet.createRow(rowIndex);
            // Write data on row
            writeBook(order, row);
            rowIndex++;
        }

        // Auto resize column witdth
        int numberOfColumn = sheet.getRow(0).getPhysicalNumberOfCells();
        autosizeColumn(sheet, numberOfColumn);

        int numberOfColumn2 = sheet2.getRow(0).getPhysicalNumberOfCells();
        autosizeColumn(sheet2, numberOfColumn2);

        // Create file excel
        createOutputFile(workbook, excelFilePath);
        System.out.println("Done!!!");
    }

    // Create workbook
    private static Workbook getWorkbook(String excelFilePath) throws IOException {
        Workbook workbook = null;

        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook();
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook();
        } else {
            throw new IllegalArgumentException("The specified file is not Excel file");
        }

        return workbook;
    }

    // Write header with format
    private static void writeHeader(Sheet sheet, int rowIndex) {
        // create CellStyle
        CellStyle cellStyle = createStyleForHeader(sheet);

        // Create row
        Row row = sheet.createRow(rowIndex);

        // Create cells
        Cell cell = row.createCell(COLUMN_INDEX_ID);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Id");

        cell = row.createCell(COLUMN_INDEX_CUSTOMER_NAME);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Customer Name");

        cell = row.createCell(COLUMN_INDEX_PHONE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Phone");

        cell = row.createCell(COLUMN_INDEX_ADDRESS);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Address");

        cell = row.createCell(COLUMN_INDEX_ORDER_TIME);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Order Time");

        cell = row.createCell(COLUMN_INDEX_STATUS);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Status");

        cell = row.createCell(COLUMN_INDEX_REVENUE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Revenue");

        cell = row.createCell(COLUMN_INDEX_PROFIT);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Profit");

    }

    private static void writeHeader2(Sheet sheet, int rowIndex) {
        // create CellStyle
        CellStyle cellStyle = createStyleForHeader(sheet);

        // Create row
        Row row = sheet.createRow(rowIndex);

        // Create cells
        Cell cell = row.createCell(COLUMN_INDEX_2_ORDERID);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Order ID");

        cell = row.createCell(COLUMN_INDEX_2_PRODUCTID);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Product ID");

        cell = row.createCell(COLUMN_INDEX_2_PRODUCT_NAME);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Product Name");

        cell = row.createCell(COLUMN_INDEX_2_COLOR);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Color");

        cell = row.createCell(COLUMN_INDEX_2_SIZE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Size");

        cell = row.createCell(COLUMN_INDEX_2_ENTRY_PRICE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Entry Price/Product");

        cell = row.createCell(COLUMN_INDEX_2_PRICE);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Selling Price/Product");

        cell = row.createCell(COLUMN_INDEX_2_QUANTITY);
        cell.setCellStyle(cellStyle);
        cell.setCellValue("Quantity");

    }

    // Write data
    private static void writeBook(SaleOrder order, Row row) {
        if (cellStyleFormatNumber == null) {
            // Format number
            short format = (short) BuiltinFormats.getBuiltinFormat("#,##0");
            // DataFormat df = workbook.createDataFormat();
            // short format = df.getFormat("#,##0");

            //Create CellStyle
            Workbook workbook = row.getSheet().getWorkbook();
            cellStyleFormatNumber = workbook.createCellStyle();
            cellStyleFormatNumber.setDataFormat(format);
        }

        Cell cell = row.createCell(COLUMN_INDEX_ID);
        cell.setCellValue(order.getOrderId());
        
        cell = row.createCell(COLUMN_INDEX_CUSTOMER_NAME);
        cell.setCellValue(order.getCustomerFullName());

        cell = row.createCell(COLUMN_INDEX_PHONE);
        cell.setCellValue(order.getPhone());

        cell = row.createCell(COLUMN_INDEX_ADDRESS);
        cell.setCellValue(order.getAddress());

        cell = row.createCell(COLUMN_INDEX_ORDER_TIME);
        Date date = order.getOrderTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String orderTime = dateFormat.format(date);
        cell.setCellValue(orderTime);

        cell = row.createCell(COLUMN_INDEX_STATUS);
        switch (order.getOrderStatusId()) {
            case 1:
                cell.setCellValue("Success");
                break;
            case 2:
                cell.setCellValue("Failure");
                break;
            case 3:
                cell.setCellValue("Pending");
                break;
            case 4:
                cell.setCellValue("Preparing");
                break;
            case 5:
                cell.setCellValue("Shipping");
                break;
            default:
                cell.setCellValue("");
        }

        cell = row.createCell(COLUMN_INDEX_REVENUE);
        cell.setCellValue(order.getTotal());

        cell = row.createCell(COLUMN_INDEX_PROFIT);
        cell.setCellValue(order.getTotalPurchaseCost());

    }

    private static void writeBook2(SaleOrderDetail order, Row row) {
        if (cellStyleFormatNumber == null) {
            // Format number
            short format = (short) BuiltinFormats.getBuiltinFormat("#,##0");
            // DataFormat df = workbook.createDataFormat();
            // short format = df.getFormat("#,##0");

            //Create CellStyle
            Workbook workbook = row.getSheet().getWorkbook();
            cellStyleFormatNumber = workbook.createCellStyle();
            cellStyleFormatNumber.setDataFormat(format);
        }

        Cell cell = row.createCell(COLUMN_INDEX_ID);
        cell.setCellValue(order.getOrderId());
        
        cell = row.createCell(COLUMN_INDEX_CUSTOMER_NAME);
        cell.setCellValue(order.getProductId());

        cell = row.createCell(COLUMN_INDEX_PHONE);
        cell.setCellValue(order.getProductName());

        
        cell = row.createCell(COLUMN_INDEX_ADDRESS);
        cell.setCellValue(order.getColor());


        cell = row.createCell(COLUMN_INDEX_ORDER_TIME);
        cell.setCellValue(order.getSize());


        cell = row.createCell(COLUMN_INDEX_STATUS);
        cell.setCellValue(order.getEntryPrice());


        cell = row.createCell(COLUMN_INDEX_REVENUE);
        cell.setCellValue(order.getPrice());


        cell = row.createCell(COLUMN_INDEX_PROFIT);
        cell.setCellValue(order.getQuantity());


    }

    // Create CellStyle for header
    private static CellStyle createStyleForHeader(Sheet sheet) {
        // Create font
        Font font = sheet.getWorkbook().createFont();
        font.setFontName("Times New Roman");
        font.setBold(true);
        font.setFontHeightInPoints((short) 14); // font size
        font.setColor(IndexedColors.WHITE.getIndex()); // text color

        // Create CellStyle
        CellStyle cellStyle = sheet.getWorkbook().createCellStyle();
        cellStyle.setFont(font);
        cellStyle.setFillForegroundColor(IndexedColors.BRIGHT_GREEN.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        return cellStyle;
    }

    // Write footer
//    private static void writeTotal(Sheet sheet, int rowIndex) {
//        // Create row
//        Row row = sheet.createRow(rowIndex);
//        Cell cell = row.createCell(COLUMN_INDEX_TOTAL_REVENUE, CellType.FORMULA);
//        int lastRow = rowIndex - 1;
//        String columnRevenue = CellReference.convertNumToColString(COLUMN_INDEX_REVENUE);
//        
//        cell.setCellFormula("SUM(" + columnRevenue + "2" + ":" + columnRevenue + lastRow + ")");
//    }
    // Auto resize column width
    private static void autosizeColumn(Sheet sheet, int lastColumn) {
        for (int columnIndex = 0; columnIndex < lastColumn; columnIndex++) {
            sheet.autoSizeColumn(columnIndex);
        }
    }

    // Create output file
    private static void createOutputFile(Workbook workbook, String excelFilePath) throws IOException {
        try ( OutputStream os = new FileOutputStream(excelFilePath)) {
            workbook.write(os);
        }
    }

    public static void downloadExcel(HttpServletResponse response) throws IOException {
        final String excelFilePath = "D:\\Ky5\\SWP391\\coza\\cozastore\\Cozastore\\web\\excel\\order.xlsx";
        LocalDateTime now = LocalDateTime.now();
        int month = now.getMonthValue();
        int year = now.getYear();
        SaleStatics orderDAO = new SaleStatics();
        List<SaleOrder> list = orderDAO.getAllOrderByMonthYear(month, year);
        List<SaleOrderDetail> detailList = orderDAO.getAllOrderDetailByMonthYear(month, year);
        writeExcel(list, detailList, excelFilePath);
        String fileName = "order.xlsx";

        // Set response headers
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

        try ( InputStream is = new FileInputStream(excelFilePath);  OutputStream os = response.getOutputStream()) {

            // Copy the Excel file to the response output stream
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
    }

//    public static void main(String[] args) throws IOException {
//        final String excelFilePath = "D:\\Ky5\\SWP391\\coza\\cozastore\\Cozastore\\web\\excel\\order.xlsx";
//        LocalDateTime now = LocalDateTime.now();
//        int month = now.getMonthValue();
//        int year = now.getYear();
//        SaleStatics orderDAO = new SaleStatics();
//        List<SaleOrder> list = orderDAO.getAllOrderByMonthYear(month, year);
//        List<SaleOrderDetail> detailList = orderDAO.getAllOrderDetailByMonthYear(month, year);
//        writeExcel(list, detailList, excelFilePath);
//    }
}
