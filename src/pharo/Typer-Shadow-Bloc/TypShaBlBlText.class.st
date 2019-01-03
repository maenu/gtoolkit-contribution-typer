Class {
	#name : #TypShaBlBlText,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlText class >> shadowedClass [
	^ BlText class
]

{ #category : #accessing }
TypShaBlBlText >> ___attribute: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlTextAttribute typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlText >> ___attributesAt: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {BlTextAttribute typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaBlBlText >> ___clearAttributes: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlockClosure typAsType asFunctionType: {BlTextAttribute typAsType} result: TypUnknownType instance optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlText >> ___from: _a to: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | BlText typAsType ];
		yourself
]
