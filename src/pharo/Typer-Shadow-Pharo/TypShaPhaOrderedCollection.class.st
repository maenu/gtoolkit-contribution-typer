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
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a receiverType parameters at: 1 ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedCollection >> ___at: _a put: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ a receiverType parameters at: 1 ] ];
		resultType: [ :a :s :r | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaOrderedCollection >> ___removeLast [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType parameters at: 1 ];
		yourself
]
