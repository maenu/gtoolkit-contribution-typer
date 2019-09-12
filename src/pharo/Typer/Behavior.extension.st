Extension { #name : #Behavior }

{ #category : #'*Typer' }
Behavior >> typIncludesBehavior: aClass [
	^ self == aClass or: [ self inheritsFrom: aClass ]
]
