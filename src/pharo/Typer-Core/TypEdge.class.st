Class {
	#name : 'TypEdge',
	#superclass : 'Object',
	#instVars : [
		'dependency',
		'dependent',
		'label',
		'data'
	],
	#category : 'Typer-Core-Type'
}

{ #category : 'instance creation' }
TypEdge class >> dependency: aType dependent: anotherType label: aString data: anObject [

	^ self new
		  initializeDependency: aType
		  dependent: anotherType
		  label: aString
		  data: anObject;
		  yourself
]

{ #category : 'accessing' }
TypEdge >> data [

	^ data
]

{ #category : 'accessing' }
TypEdge >> dependency [

	^ dependency
]

{ #category : 'accessing' }
TypEdge >> dependent [

	^ dependent
]

{ #category : 'initialization' }
TypEdge >> initializeDependency: aType dependent: anotherType label: aString data: anObject [

	dependency := aType.
	dependent := anotherType.
	label := aString.
	data := anObject
]

{ #category : 'accessing' }
TypEdge >> label [

	^ label
]
