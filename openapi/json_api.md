# JsonApi

openapi definitions for jsonapi structures

``` yaml
responses:
  JsonApiErrorResponse:
    description: A JSON:API-compliant error response
    content:
      application/json:
        schema:
          $ref: "#/components/schemas/JsonApiErrorResponseObject"
schemas:
  JsonApiErrorResponseObject:
      type: object
      required:
        - errors
      properties:
        errors:
          description: An array of Error objects
          type: array
          minItems: 1
          items:
            $ref: "#/components/schemas/JsonApiErrorObject"
    JsonApiErrorObject:
      description: An error object following the JSON:API specification
      type: object
      required:
        - status
        - title
      properties:
        id:
          description: a unique identifier for this particular occurrence of the problem
          type: string
          format: uuid
        links:
          description: a link to further details about this particular occurrence of the problem
          type: object
          properties:
            about:
              $ref: "#/components/schemas/JsonApiLink"
        status:
          description: the HTTP status code applicable to this problem
          type: string
          minLength: 3
          maxLength: 3
        code:
          description: an application-specific error code
          type: string
        title:
          description: a short, human-readable summary of the problem that SHOULD NOT change from occurrence to occurrence of the problem, except for purposes of localization
          type: string
        detail:
          description: a human-readable explanation specific to this occurrence of the problem. Like title, this field’s value can be localized
          type: string
        source:
          description: contains references to the source of the error
          type: object
          properties:
            pointer:
              description: a JSON Pointer [RFC6901] to the associated entity in the request document
              type: string
            parameter:
              description: indicates which URI query parameter caused the error
              type: string
        meta:
          description: a JSON meta object with non-standard meta-information about the error
          type: object
          additionalProperties: true
    JsonApiLink:
      title: JSON:API Link
      description: A JSON:API link can be either a URL string or a structured link object.
      oneOf:
        - $ref: "#/components/schemas/JsonApiUrl"
        - $ref: "#/components/schemas/JsonApiLinkObject"
    JsonApiUrl:
      type: string
      format: url
      example: "https://example.com/"
    JsonApiLinkObject:
      title: JSON:API Link Object
      description: a structured representation of a URL
      type: object
      required:
        - href
      properties:
        href:
          type: string
          example: "https://example.com/"
        meta:
          type: object
          example:
            count: "10"
```
