package tw.com.iwow.enums.converter;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;

@Converter
public class VisConverter implements AttributeConverter<Visibility, String> {

	@Override
	public String convertToDatabaseColumn(Visibility vis) {
		return vis.name();
	}

	@Override
	public Visibility convertToEntityAttribute(String visStr) {
		return Enum.valueOf(Visibility.class, visStr);
	}

}
