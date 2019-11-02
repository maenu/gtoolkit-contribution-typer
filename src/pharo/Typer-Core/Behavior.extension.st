Extension { #name : #Behavior }

{ #category : #'*Typer-Core' }
Behavior >> typIncludesBehavior: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'Boolean'>
	^ self == aClass or: [ self inheritsFrom: aClass ]
]
