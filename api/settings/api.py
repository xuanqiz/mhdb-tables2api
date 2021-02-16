from rest_framework import routers
from rest_framework.documentation import include_docs_urls
from django.urls import path

from assessments.views import QuestionnaireViewset, AuthorViewset

router = routers.DefaultRouter()
# model endpoint sets
router.register(r'author', AuthorViewset)
router.register(r'questionnaire', QuestionnaireViewset)

extra_paths = [
    path('docs/', include_docs_urls(title='MHDB - REST API DOCS'))
] 

router_urls = extra_paths + router.urls