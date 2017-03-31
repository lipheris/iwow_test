package tw.com.iwow.enums.converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import tw.com.iwow.enums.Assort;

@Converter
public class AssortConverter implements AttributeConverter<Assort, String> {

	@Override
	public String convertToDatabaseColumn(Assort assort) {
		return assort.name();
	}

	@Override
	public Assort convertToEntityAttribute(String assortStr) {
		return Enum.valueOf(Assort.class, assortStr);
	}

}
