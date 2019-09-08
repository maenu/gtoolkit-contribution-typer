Class {
	#name : #TypShaGtGtPharoUnaryMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoUnaryMessageNode class >> shadowedClass [
	^ GtPharoUnaryMessageNode class
]

{ #category : #accessing }
TypShaGtGtPharoUnaryMessageNode >> ___parent [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtPharoMessageSendNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtPharoUnaryMessageNode >> ___selectorPart [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SmaCCToken typAsType ];
		yourself
]
