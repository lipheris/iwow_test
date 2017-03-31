package tw.com.iwow.enums.converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import tw.com.iwow.enums.Gender;

@Converter
public class GenderConverter implements AttributeConverter<Gender, String> {

	@Override
	public String convertToDatabaseColumn(Gender gender) {
		return gender.name();
	}

	@Override
	public Gender convertToEntityAttribute(String genderStr) {
		return Enum.valueOf(Gender.class, genderStr);
	}

}
