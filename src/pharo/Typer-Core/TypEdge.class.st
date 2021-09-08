Class {
	#name : #TypEdge,
	#superclass : #Object,
	#instVars : [
		'dependency',
		'dependent',
		'path'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypEdge class >> dependency: aType dependent: anotherType path: aValuable [

	^ self new
		  initializeDependency: aType
		  dependent: anotherType
		  path: aValuable;
		  yourself
]

{ #category : #accessing }
TypEdge >> dependency [

	^ dependency
]

{ #category : #accessing }
TypEdge >> dependent [

	^ dependent
]

{ #category : #initialization }
TypEdge >> initializeDependency: aType dependent: anotherType path: aValuable [

	dependency := aType.
	dependent := anotherType.
	path := aValuable
]

{ #category : #accessing }
TypEdge >> path [

	^ path
]
