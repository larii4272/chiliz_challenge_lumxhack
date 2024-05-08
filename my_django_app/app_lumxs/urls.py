from django.urls import path
from . import views

#urlpatterns = [
#    path('', views.index),
#]

urlpatterns = [
    #path('', views.index, name='index'),
    path('', views.index, name='initial_page'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('experiences/', views.getExperiences),
    path('athletes/', views.getAthletes),
    path('lumxtokens/', views.getLumxTokens),
    path('soliditytokens/', views.getSolidityTokens),
    path('wallet/', views.getWallet),
    path('create_solidity_token/', views.create_solidity_token, name='create_solidity_token'),
    path('create_solidity_auction/', views.create_solidity_auction, name='create_solidity_auction'),
    path('purchase_solidity_token/', views.purchase_solidity_token, name='purchase_solidity_token'),
    path('get_all_solidity_token/', views.get_all_solidity_token, name='get_all_solidity_token'),
    path('get_all_solidity_auction/', views.get_all_solidity_auction, name='get_all_solidity_auction'),
]