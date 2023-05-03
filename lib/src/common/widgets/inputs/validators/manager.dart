import 'package:reactive_forms/reactive_forms.dart';
import '../../../models/template.dart';
import 'required_validator.dart';

class ValidatorsManager {
  static void initializeValidators<T>(
    AbstractControl<T> control,
    List<FieldValidator> validators,
  ) {
    for (var validator in validators) {
      initializeValidator(control, validator);
    }
  }

  static void initializeValidator<T>(
    AbstractControl<T> t,
    FieldValidator validator,
  ) {
    // validators

    if (validator.required == true) {
      t.setValidators(
        [RequiredValidator().validate],
        autoValidate: true,
      );
    }

    if (validator.regex != null) {
      t.setValidators(
        [Validators.pattern(validator.regex ?? '')],
        autoValidate: true,
      );
    }

    switch (validator.type) {
      case FieldValidatorTypes.RequiredValidator:
        t.setValidators(
          [RequiredValidator().validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.DecimalNumbersValidator:
        break;
      case FieldValidatorTypes.ExtensionsValidator:
        break;
      case FieldValidatorTypes.MaximumConstDateValidator:
        break;
      case FieldValidatorTypes.MaximumItemsValidator:
        break;
      case FieldValidatorTypes.MaximumLengthValidator:
        break;
      case FieldValidatorTypes.MaximumNumberValidator:
        break;
      case FieldValidatorTypes.MaximumRelativeDateValidator:
        break;
      case FieldValidatorTypes.MinimumConstDateValidator:
        break;
      case FieldValidatorTypes.MinimumItemsValidator:
        break;
      case FieldValidatorTypes.MinimumLengthValidator:
        break;
      case FieldValidatorTypes.MinimumNumberValidator:
        break;
      case FieldValidatorTypes.MinimumRelativeDateValidator:
        break;
      case FieldValidatorTypes.RegexValidator:
        break;

      default:
    }
  }

  static final Map<String, String Function(Object)> defaultValidationMessages =
      {
    ValidationMessage.any: (obj) => "Errore Valore immesso",
    ValidationMessage.compare: (obj) => "Errore comparazione",
    ValidationMessage.contains: (obj) => "Non contiene il valore",
    ValidationMessage.creditCard: (obj) => "Numero Carta non valida",
    ValidationMessage.email: (obj) => "Email non valida",
    ValidationMessage.equals: (obj) => "il valore immesso non è uguale",
    ValidationMessage.max: (obj) => "Valore Massimo superato",
    ValidationMessage.maxLength: (obj) => "Lunghezza massima superata",
    ValidationMessage.min: (obj) => "Valore minimo non valido",
    ValidationMessage.minLength: (obj) => "Lunghezza minima non valida",
    ValidationMessage.mustMatch: (obj) => "Valore Obbligatorio",
    ValidationMessage.number: (obj) => "Numero richiesto",
    ValidationMessage.pattern: (obj) => "Pattern non coerente",
    ValidationMessage.required: (obj) => "Valore obbligatorio",
    ValidationMessage.requiredTrue: (obj) => "Valore Obbligatorio",
  };
}
