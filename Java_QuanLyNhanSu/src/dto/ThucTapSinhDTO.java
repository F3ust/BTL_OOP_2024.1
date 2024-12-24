package dto;

public class ThucTapSinhDTO extends PeopleDTO {
	private int hourRate=100000;
	private int contractDuration;
	public int getHourRate() {
		return hourRate;
	}
	public void setHourRate(int hourRate) {
		this.hourRate = hourRate;
	}
	public int getContractDuration() {
		return contractDuration;
	}
	public void setContractDuration(int contractDuration) {
		this.contractDuration = contractDuration;
	}
	
}
