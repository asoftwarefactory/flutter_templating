import 'package:flutter_templating/src/common/extensions/abstract_control.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../models/template.dart';
import 'decimal_numers_validator.dart';
import 'extensions_validator.dart';
import 'maximum_const_date_validator.dart';
import 'maximum_items_validator.dart';
import 'maximum_length_validator.dart';
import 'maximum_numer_validator.dart';
import 'maximum_relative_date_validator.dart';
import 'minimum_const_date_validator.dart';
import 'minimum_items_validator.dart';
import 'minimum_length_validator.dart';
import 'minimum_number_validator.dart';
import 'minimum_relative_date_validator.dart';
import 'regex_validator.dart';
import 'required_validator.dart';

class ValidatorsManager {
  static void initializeValidators<T>(
    AbstractControl<T> control,
    List<FieldValidator> validators,
    bool isArray,
  ) {
    for (var validator in validators) {
      initializeValidator(control, validator, isArray);
    }
  }

  static void initializeValidator<T>(
    AbstractControl<T> t,
    FieldValidator validator,
    bool isArray,
  ) {
    switch (validator.type) {
      case FieldValidatorTypes.RequiredValidator:
        t.pushValidator(
          RequiredValidator(isArray: isArray).validate,
          autoValidate: true,
        );
        break;
      case FieldValidatorTypes.DecimalNumbersValidator:
        if (validator.numOfDecimals != null) {
          t.pushValidator(
            DecimalNumbersValidator(validator.numOfDecimals!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.ExtensionsValidator:
        if (validator.extensions != null) {
          t.pushValidator(
            ExtensionsValidator(validator.extensions!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MaximumConstDateValidator:
        if (validator.date != null) {
          t.pushValidator(
            MaximumConstDateValidator(validator.date!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MaximumItemsValidator:
        if (validator.length != null) {
          t.pushValidator(
            MaximumItemsValidator(validator.length!).validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MaximumLengthValidator:
        if (validator.length != null) {
          t.pushValidator(
            MaximumLengthValidator(validator.length!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MaximumNumberValidator:
        if (validator.number != null) {
          t.pushValidator(
            MaximumNumberValidator(validator.number!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MaximumRelativeDateValidator:
        if (validator.date != null) {
          t.pushValidator(
            MaximumRelativeDateValidator(validator.date!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MinimumConstDateValidator:
        if (validator.date != null) {
          t.pushValidator(
            MinimumConstDateValidator(validator.date!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MinimumItemsValidator:
        if (validator.length != null) {
          t.pushValidator(
            MinimumItemsValidator(validator.length!).validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MinimumLengthValidator:
        if (validator.length != null) {
          t.pushValidator(
            MinimumLengthValidator(validator.length!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MinimumNumberValidator:
        if (validator.number != null) {
          t.pushValidator(
            MinimumNumberValidator(validator.number!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.MinimumRelativeDateValidator:
        if (validator.date != null) {
          t.pushValidator(
            MinimumRelativeDateValidator(validator.date!, isArray: isArray)
                .validate,
            autoValidate: true,
          );
        }
        break;
      case FieldValidatorTypes.RegexValidator:
        if (validator.regex != null) {
          t.pushValidator(
            RegexValidator(RegExp(validator.regex!), isArray: isArray).validate,
            autoValidate: true,
          );
        }
        break;

      default:
    }

    if (validator.regex != null &&
        validator.type != FieldValidatorTypes.RegexValidator) {
      t.pushValidator(
        RegexValidator(RegExp(validator.regex!), isArray: isArray).validate,
        autoValidate: true,
      );
    }
    if (validator.required == true &&
        validator.type != FieldValidatorTypes.RequiredValidator) {
      t.pushValidator(
        RequiredValidator(isArray: isArray).validate,
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
