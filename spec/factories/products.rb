# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sys { {"type": 'Array'} }
    items { {
      "sys": {
        "space": {
          "sys": {
            "type": "Link",
            "linkType": "Space",
            "id": "inuxiom9wh7d"
          }
        },
        "id": "2WGCLqJK6fhpZ5R8nsCNcN",
        "type": "Entry",
        "createdAt": "2019-11-11T13:50:03.190Z",
        "updatedAt": "2019-11-11T13:50:03.190Z",
        "environment": {
          "sys": {
            "id": "master",
            "type": "Link",
            "linkType": "Environment"
          }
        },
        "revision": 1,
        "contentType": {
          "sys": {
            "type": "Link",
            "linkType": "ContentType",
            "id": "product"
          }
        }
      },
      "fields": {
        "name": {
          "en-US": "V60 Drip"
        },
        "quantity": {
          "en-US": 50
        },
        "price": {
          "en-US": 22
        }
      }
    } }
    nextSyncUrl { "http://cdn.contentful.com/spaces/inuxiom9wh7d/environments/master/sync?sync_token=w5ZGw6JFwqZmVcKsE8Kow4grw45QdyYYwrsFwpXDmsKUw4zDiDwIRFXDp8KqGR8UwqrDk8OiTGA1M8KaXmzCqcKew7nChmzCjhcsw5_DhEEtIRjDjMOWw5d7w689O8OSXF8Dw6VpwpnCtjkgHcKFw6NBb8Ou" }
  end
end