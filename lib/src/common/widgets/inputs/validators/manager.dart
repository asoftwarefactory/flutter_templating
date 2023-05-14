import 'package:reactive_forms/reactive_forms.dart';
import '../../../models/template.dart';
import 'decimal_numers_validator.dart';
import 'extensions_validator.dart';
import 'maximum_const_date_validator.dart';
import 'maximum_items_validator.dart';
import 'maximum_length_validator.dart';
import 'maximum_numer_validator.dart';
import 'maximum_relative_date_validator.dart';
import 'minimum_items_validator.dart';
import 'minimum_length_validator.dart';
import 'minimum_number_validator.dart';
import 'minimum_relative_date_validator.dart';
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

    switch (validator.type) {
      case FieldValidatorTypes.RequiredValidator:
        t.setValidators(
          [RequiredValidator().validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.DecimalNumbersValidator:
        t.setValidators(
          [DecimalNumbersValidator().validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.ExtensionsValidator:
        t.setValidators(
          // TODO
          [ExtensionsValidator.validate([])],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MaximumConstDateValidator:
        t.setValidators(
          // TODO
          [MaximumConstDateValidator('', "").validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MaximumItemsValidator:
        t.setValidators(
          // TODO
          [MaximumItemsValidator(0, "").validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MaximumLengthValidator:
        t.setValidators(
          // TODO
          [MaximumLengthValidator(0, message: "").validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MaximumNumberValidator:
        t.setValidators(
          // TODO
          [MaximumNumberValidator(0).validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MaximumRelativeDateValidator:
        t.setValidators(
          // TODO
          [MaximumRelativeDateValidator(0).validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MinimumConstDateValidator:
        t.setValidators(
          // TODO
          [MaximumRelativeDateValidator(0).validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MinimumItemsValidator:
        t.setValidators(
          // TODO
          [MinimumItemsValidator(0).validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MinimumLengthValidator:
        t.setValidators(
          // TODO
          [MinimumLengthValidator(0).validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MinimumNumberValidator:
        t.setValidators(
          // TODO
          [MinimumNumberValidator(0).validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.MinimumRelativeDateValidator:
        t.setValidators(
          // TODO
          [MinimumRelativeDateValidator(DateTime.now(), "").validate],
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.RegexValidator:
        t.setValidators(
          // TODO
          [Validators.pattern("")],
          autoValidate: true,
        );
        break;

      default:
    }

    if (validator.required == true) {
      t.setValidators(
        [...t.validators, RequiredValidator().validate],
        autoValidate: true,
      );
    }

    if (validator.regex != null) {
      t.setValidators(
        [...t.validators, Validators.pattern(validator.regex ?? '')],
        autoValidate: true,
      );
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
