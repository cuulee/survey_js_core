import 'package:flutter_test/flutter_test.dart';
import 'package:survey_js_core/model/element.dart';
import 'package:survey_js_core/model/question_select_base.dart';

import 'package:survey_js_core/model/question_text.dart';
import 'package:survey_js_core/model/question_checkbox.dart';
import 'package:survey_js_core/model/question_radio.dart';
import 'package:survey_js_core/model/question.dart';
import 'package:survey_js_core/survey_js_core.dart';
import 'package:survey_js_core/model/page.dart';

void main() {
  test('parse question type text without error', () {
    var json = {
      "name": "name",
      "type": "text",
      "inputType": "text",
      "title": "Please enter your name:",
      "placeHolder": "Jon Snow",
      "maxLength": 10,
      "size": 10,
      "no": "23",
      "isRequired": true
    };

    QuestionTextModel mockModel = QuestionTextModel(json);
    mockModel.inputType = InputType.TEXT;
    mockModel.name = "name";
    mockModel.type = "text";
    mockModel.title = "Please enter your name:";
    mockModel.placeHolder = "Jon Snow";
    mockModel.maxLength = 10;
    mockModel.size = 10;
    mockModel.no = "23";
    mockModel.isRequired = true;

    expect(QuestionTextModel(json), mockModel);
  });

  test('parse question type checkbox without error', () {
    var json = {
      "type": "checkbox",
      "name": "select books type",
      "width": "50",
      "title": "select books type",
      "description": "select book type",
      "valueName": "89",
      "isRequired": true,
      "colCount": 3,
      "requiredErrorText": "please select atleast 1 book type",
      "hasComment": true,
      "otherPlaceHolder": "please mention other book type",
      "choices": ["fiction", "thriller", "biography"],
      "choicesOrder": "desc",
      "hideIfChoicesEmpty": true,
      "otherErrorText": "other is mandatory",
      "hasSelectAll": true,
      "hasNone": true,
      "noneText": "no book for my type",
      "selectAllText": "select all book type"
    };

    QuestionCheckboxModel mockCheckboxModel = QuestionCheckboxModel(json);

    mockCheckboxModel.type = "checkbox";
    mockCheckboxModel.name = "select books type";
    mockCheckboxModel.width = "50";
    mockCheckboxModel.title = "select books type";
    mockCheckboxModel.description = "select books type";
    mockCheckboxModel.valueName = "89";
    mockCheckboxModel.colCount = 3;
    mockCheckboxModel.isRequired = true;
    mockCheckboxModel.requiredErrorText = "please select atleast 1 book type";
    mockCheckboxModel.hasComment = true;
    mockCheckboxModel.otherPlaceHolder = "please mention other book type";
    mockCheckboxModel.choices = List.from(["fiction,thriller,biography"]);
    mockCheckboxModel.choicesOrder = ChoiceOrder.DESC;
    mockCheckboxModel.hideIfChoicesEmpty = true;
    mockCheckboxModel.otherErrorText = "other is mandatory";
    mockCheckboxModel.hasSelectAll = true;
    mockCheckboxModel.hasNone = true;
    mockCheckboxModel.noneText = "no book for my type";
    mockCheckboxModel.selectAllText = "select all book type";

    expect(QuestionCheckboxModel(json), mockCheckboxModel);
  });

  test('parse question type radiogroup without error', () {
    var json = {
      "type": "radiogroup",
      "name": "question1",
      "width": "50",
      "startWithNewLine": false,
      "title": "select department",
      "description": "select department for you work",
      "valueName": "department",
      "isRequired": true,
      "requiredErrorText": "select department",
      "hasComment": true,
      "otherPlaceHolder": "other department",
      "choices": ["android", "ios", "web"],
      "choicesOrder": "random",
      "hideIfChoicesEmpty": true,
      "otherErrorText": "required",
      "showClearButton": true
    };

    QuestionRadioModel mockRadioGroupModel = QuestionRadioModel(json);

    mockRadioGroupModel.type = "radiogroup";
    mockRadioGroupModel.name = "select books type";
    mockRadioGroupModel.width = "50";
    mockRadioGroupModel.title = "select books type";
    mockRadioGroupModel.description = "select books type";
    mockRadioGroupModel.valueName = "89";
    mockRadioGroupModel.colCount = 3;
    mockRadioGroupModel.isRequired = true;
    mockRadioGroupModel.requiredErrorText = "please select atleast 1 book type";
    mockRadioGroupModel.hasComment = true;
    mockRadioGroupModel.otherPlaceHolder = "please mention other book type";
    mockRadioGroupModel.choices = List.from(["fiction,thriller,biography"]);
    mockRadioGroupModel.choicesOrder = ChoiceOrder.DESC;
    mockRadioGroupModel.hideIfChoicesEmpty = true;
    mockRadioGroupModel.otherErrorText = "other is mandatory";
    mockRadioGroupModel.showClearButton = true;
    expect(QuestionRadioModel(json), mockRadioGroupModel);
  });

  test('parse multiple question type', () {
    var json = {
      "elements": [
        {
          "type": "text",
          "name": "question1",
          "width": "20",
          "title": "your name",
          "description": "name will be enter here",
          "valueName": "name",
          "isRequired": true,
          "requiredErrorText": "please enter your name",
          "maxLength": 25,
          "placeHolder": "enter your name here"
        },
        {
          "type": "checkbox",
          "name": "question2",
          "width": "50",
          "title": "select song language you listen",
          "description": "select your languages of songs",
          "valueName": "song you listen..",
          "isRequired": true,
          "requiredErrorText": "select atleast on language",
          "hasComment": true,
          "otherPlaceHolder": "other language you listen",
          "choices": ["hindi", "english", "gujarati"],
          "choicesOrder": "asc",
          "hasSelectAll": true,
          "hasNone": true,
          "selectAllText": "all language"
        },
        {
          "type": "radiogroup",
          "name": "question3",
          "width": "50",
          "title": "select gender",
          "description": "select gender",
          "valueName": "gender",
          "isRequired": true,
          "requiredErrorText": "select one gender type",
          "choices": ["male", "female", "other"],
          "choicesOrder": "asc",
          "hideIfChoicesEmpty": true,
          "showClearButton": true
        }
      ]
    };
    List<QuestionModel> questions = List();

    QuestionTextModel textModel = QuestionTextModel(json);
    textModel.inputType = InputType.TEXT;
    textModel.name = "question1";
    textModel.type = "text";
    textModel.title = "your name";
    textModel.placeHolder = "enter your name here";
    textModel.maxLength = 25;
    textModel.width = "20";
    textModel.valueName = "name";
    textModel.requiredErrorText = "please enter your name";
    textModel.isRequired = true;
    questions.add(textModel);

    QuestionCheckboxModel checkboxModel = QuestionCheckboxModel(json);

    checkboxModel.type = "checkbox";
    checkboxModel.name = "question2";
    checkboxModel.width = "50";
    checkboxModel.title = "select song language you listen";
    checkboxModel.description = "select your languages of songs";
    checkboxModel.valueName = "song you listen..";
    checkboxModel.isRequired = true;
    checkboxModel.requiredErrorText = "select atleast on language";
    checkboxModel.hasComment = true;
    checkboxModel.otherPlaceHolder = "other language you listen";
    checkboxModel.choices = List.from(["hindi", "english", "gujarati"]);
    checkboxModel.choicesOrder = ChoiceOrder.ASE;
    checkboxModel.hasSelectAll = true;
    checkboxModel.hasNone = true;
    checkboxModel.selectAllText = "all language";

    questions.add(checkboxModel);

    QuestionRadioModel radioModel = QuestionRadioModel(json);

    radioModel.type = "radiogroup";
    radioModel.name = "question3";
    radioModel.width = "50";
    radioModel.title = "select gender";
    radioModel.description = "select gender";
    radioModel.valueName = "gender";
    radioModel.isRequired = true;
    radioModel.requiredErrorText = "select one gender type";
    radioModel.choices = List.from(["male", "female", "other"]);
    radioModel.choicesOrder = ChoiceOrder.ASE;
    radioModel.hideIfChoicesEmpty = true;
    radioModel.showClearButton = true;

    questions.add(radioModel);
    expect(ElementSurvey(json["elements"]).questions, questions);
  });

  test('parse pages successfully', () {
    var json = {
      "pages": [
        {
          "name": "page1",
          "elements": [
            {
              "type": "text",
              "name": "question1",
              "width": "20",
              "title": "your name",
              "description": "name will be enter here",
              "valueName": "name",
              "isRequired": true,
              "requiredErrorText": "please enter your name",
              "maxLength": 25,
              "placeHolder": "enter your name here"
            },
//            {
//              "type": "panel",
//              "name": "panel1",
//              "elements": [
//                {"type": "text", "name": "question5"}
//              ],
//              "enableIf": "{song you listen..} = [\"hindi\"]"
//            },
            {
              "type": "checkbox",
              "name": "question2",
              "width": "50",
              "title": "select song language you listen",
              "description": "select your languages of songs",
              "valueName": "song you listen..",
              "isRequired": true,
              "requiredErrorText": "select atleast on language",
              "hasComment": true,
              "otherPlaceHolder": "other language you listen",
              "choices": ["hindi", "english", "gujarati"],
              "choicesOrder": "asc",
              "hasSelectAll": true,
              "hasNone": true,
              "selectAllText": "all language"
            },
            {
              "type": "radiogroup",
              "name": "question3",
              "width": "50",
              "title": "select gender",
              "description": "select gender",
              "valueName": "gender",
              "isRequired": true,
              "requiredErrorText": "select one gender type",
              "choices": ["male", "female", "other"],
              "choicesOrder": "asc",
              "hideIfChoicesEmpty": true,
              "showClearButton": true
            }
          ],
          "questionTitleLocation": "top"
        }
      ]
    };

    List<PageModel> pages = List();
    List<QuestionModel> questions = List();

    QuestionTextModel textModel = QuestionTextModel(json);
    textModel.inputType = InputType.TEXT;
    textModel.name = "question1";
    textModel.type = "text";
    textModel.title = "your name";
    textModel.placeHolder = "enter your name here";
    textModel.maxLength = 25;
    textModel.width = "20";
    textModel.valueName = "name";
    textModel.requiredErrorText = "please enter your name";
    textModel.isRequired = true;
    questions.add(textModel);

    QuestionCheckboxModel checkboxModel = QuestionCheckboxModel(json);

    checkboxModel.type = "checkbox";
    checkboxModel.name = "question2";
    checkboxModel.width = "50";
    checkboxModel.title = "select song language you listen";
    checkboxModel.description = "select your languages of songs";
    checkboxModel.valueName = "song you listen..";
    checkboxModel.isRequired = true;
    checkboxModel.requiredErrorText = "select atleast on language";
    checkboxModel.hasComment = true;
    checkboxModel.otherPlaceHolder = "other language you listen";
    checkboxModel.choices = List.from(["hindi", "english", "gujarati"]);
    checkboxModel.choicesOrder = ChoiceOrder.ASE;
    checkboxModel.hasSelectAll = true;
    checkboxModel.hasNone = true;
    checkboxModel.selectAllText = "all language";

    questions.add(checkboxModel);

    QuestionRadioModel radioModel = QuestionRadioModel(json);

    radioModel.type = "radiogroup";
    radioModel.name = "question3";
    radioModel.width = "50";
    radioModel.title = "select gender";
    radioModel.description = "select gender";
    radioModel.valueName = "gender";
    radioModel.isRequired = true;
    radioModel.requiredErrorText = "select one gender type";
    radioModel.choices = List.from(["male", "female", "other"]);
    radioModel.choicesOrder = ChoiceOrder.ASE;
    radioModel.hideIfChoicesEmpty = true;
    radioModel.showClearButton = true;

    questions.add(radioModel);
    PageModel pageModel =PageModel(json);
    pageModel.name="page1";
    pageModel.element=ElementSurvey(json["elements"]);
    pages.add(pageModel);
    SurveyJsonParser surveyJsonParser = SurveyJsonParser();
    expect(surveyJsonParser.parseAllPages(json), pages);
  });
}