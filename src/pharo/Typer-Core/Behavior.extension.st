Extension { #name : #Behavior }

{ #category : #'*Typer-Core' }
Behavior >> typIncludesBehavior: aClass [
	^ self == aClass or: [ self inheritsFrom: aClass ]
]
