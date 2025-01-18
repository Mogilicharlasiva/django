from django.shortcuts import render
from django.http import HttpResponse


posts_data=[
    {
        'author': 'siva',
        'title': 'Blog post 1',
        'content': 'This is the post 1',
        'date_posted': 'Jan 1st, 2025'
    },
    {
        'author': 'msk',
        'title': 'Blog post 2',
        'content': 'This is the post 2',
        'date_posted': 'Jan 1st, 2025'
    }
]
# Create your views here.

def home(request):
    context={
        'posts': posts_data
    }
    return render(request, 'blog/home.html', context)
def about(request):
    title={
        'title': 'About'
    }
    return render(request, 'blog/about.html', title)
    