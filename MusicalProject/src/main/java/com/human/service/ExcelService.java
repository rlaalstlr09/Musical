package com.human.service;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.human.dto.MusicalDto;
import com.human.vo.BoardVo;

import java.io.ByteArrayOutputStream;
import java.util.List;

@Service
public class ExcelService {

    private final IMusicalService service; // MusicalService는 기존 서비스로, 데이터를 가져오는 역할을 합니다.

    public ExcelService(IMusicalService service) {
        this.service = service;
    }

    public byte[] generateMusicalExcel(BoardVo vo) throws Exception {
        List<MusicalDto> musicals = service.musical_listSearch_excel(vo);
        System.out.println("Musicals size: " + musicals.size());

        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Musicals");

        // Header row
        Row headerRow = sheet.createRow(0);
        String[] headers = {"뮤지컬 제목", "공연 기간", "러닝 타임", "제한 연령"};
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
        }

        // Data rows
        int rowNum = 1;
        for (MusicalDto musical : musicals) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(musical.getMusical_title());
            row.createCell(1).setCellValue(musical.getFormattedMusical_period_start() + " ~ " + musical.getFormattedMusical_period_end());
            row.createCell(2).setCellValue(musical.getMusical_runningtime());
            row.createCell(3).setCellValue(musical.getMusical_agelimit());
        }

        // Auto-size columns
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        workbook.write(bos);
        workbook.close();

        return bos.toByteArray();
    }
}
