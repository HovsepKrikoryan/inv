@items
Feature: Items tests http://inv.bg/objects/manage

  Background:
    Given user is logged in the system
    Then user panel should contain text "karamfilovs@gmail.com"

  Scenario: Navigate to items page
    When I navigate to Items page
    Then Add New Item button should contain text "Нов Артикул"
    When I clean all items on API level


  Scenario Outline: Create new item with valid information
    When I navigate to Items page
    Then Add New Item button should contain text "Нов Артикул"
    When I create new item with name "<name>" and nameENG "<nameENG>" and price "<price>" and priceQuantity "<priceQuantity>"
    Then item message with text should be displayed "<addSuccess>"
    When I delete all items
    Then item message with text should be displayed "<deleteSuccess>"
    Examples:
      | name             | nameENG        | price | priceQuantity | addSuccess                   | deleteSuccess                            |
      | Кафе             | Coffee         | 10    | 1             | Артикулът е добавен успешно. | Избраните артикули бяха изтрити успешно. |
      | Джони Уокър      | Johny Walker   | 25.56 | 1.1           | Артикулът е добавен успешно. | Избраните артикули бяха изтрити успешно. |
      | Курс: Тестване 1 | Testing Course | 650   | 20            | Артикулът е добавен успешно. | Избраните артикули бяха изтрити успешно. |

