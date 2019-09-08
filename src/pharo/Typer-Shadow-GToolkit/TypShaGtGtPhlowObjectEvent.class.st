Class {
	#name : #TypShaGtGtPhlowObjectEvent,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowObjectEvent class >> shadowedClass [
	^ GtPhlowObjectEvent class
]

{ #category : #accessing }
TypShaGtGtPhlowObjectEvent >> ___object: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Object typAsType asNullableType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPhlowObjectEvent >> ___sourceElement: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | BlElement typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
