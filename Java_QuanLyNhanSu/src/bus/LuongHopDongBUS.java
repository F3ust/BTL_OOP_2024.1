package bus;

import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

import dao.BangChamCongDAO;
import dao.ChamCongDAO;
import dao.ChucVuDAO;
import dao.HopDongLaoDongDAO;
import dao.KhenThuongDAO;
import dao.LuongDAO;
import dao.NhanVienDAO;
import dto.BangChamCongDTO;
import dto.ChamCongDTO;
import dto.ChucVuDTO;
import dto.KhenThuongDTO;
import dto.ThucTapSinhDTO;

public class LuongHopDongBUS implements TinhLuong {
	private LuongDAO luongDAO = new LuongDAO();
	private NhanVienDAO nvDAO = new NhanVienDAO();
	private ChamCongDAO ccDAO = new ChamCongDAO();
	private BangChamCongDAO bccDAO = new BangChamCongDAO();
	private KhenThuongDAO ktDAO = new KhenThuongDAO();
	private HopDongLaoDongDAO hdDAO = new HopDongLaoDongDAO();
	private ChucVuDAO cvDAO = new ChucVuDAO();

	@Override
	public DefaultTableModel LuongGet(int maNv, int thang, int nam) {
		if (maNv == 0) {
			JOptionPane.showMessageDialog(null, "Vui lòng chọn NV");
			return null;
		}
		Vector<String> header = new Vector<String>();
		header.add("Lương CB");
		header.add("Khen thưởng");
		header.add("Phụ cấp");
		header.add("Số ngày nghỉ");
		header.add("Trừ lương");
		header.add("Tổng");

		DefaultTableModel dtm = new DefaultTableModel(header, 0) {
			@Override
			public Class<?> getColumnClass(int column) {
				switch (column) {
				case 0:
					return Integer.class;
				default:
					return Integer.class;
				}
			}
		};
		
		String thangString = nam + "-" + thang + "-1";
		ThucTapSinhDTO thuctapsinh = new ThucTapSinhDTO();
		int luongCb = thuctapsinh.getHourRate();
		
		
		double tongLuong = 0;

		ChamCongDTO chamCong = ccDAO.ChamCongGet(maNv, thangString);

		ArrayList<BangChamCongDTO> bangChamCong = bccDAO.BangChamCongGet(chamCong.getMaChamCong());
		int dateCount = 0;

		switch (thang) {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				dateCount = 31;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				dateCount = 30;
				break;
			case 2:
				if (nam % 4 == 0) {
					dateCount = 29;
				} else {
					dateCount = 28;
				}
				break;
		}
		
		// chấm công
		double soNgaylam = 0;
		int soNgaynghi=0;
		
			for (int i = 0; i < bangChamCong.size(); i++) {
				BangChamCongDTO bccDto = bangChamCong.get(i);
				String trangThai = bccDto.getTrangThai();
				switch (trangThai) {
				case "x":
					soNgaylam++;
					break;
				case "n":
					soNgaynghi++;
					break;
				case "null":
					soNgaylam++;
					break;
				case "1/2":
					soNgaylam=soNgaylam+0.5;
					break;
				}
			}
		
		
		tongLuong = luongCb*soNgaylam ;
		
		Object[] rowData = {0, 0, 0, soNgaynghi, 0, tongLuong};
		dtm.addRow(rowData);
		
		return dtm;
	}

}
