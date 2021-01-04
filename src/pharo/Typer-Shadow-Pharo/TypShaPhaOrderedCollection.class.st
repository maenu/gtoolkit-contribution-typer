Class {
	#name : #TypShaPhaOrderedCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOrderedCollection class >> shadowedClass [
	^ OrderedCollection class
]

{ #category : #accessing }
TypShaPhaOrderedCollection >> ___addFirst: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedCollection >> ___at: _a put: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ '@A' typAsVariableType resolveIn: a receiverType ] ];
		resultType: [ :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedCollection >> ___removeLast [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #converting }
TypShaPhaOrderedCollection >> asType: aClass [
	^ aClass typAsParametricTypeWithParameters: {'@A'}
]
