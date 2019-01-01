Class {
	#name : #TypShaGtGtCoderMethodsCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtCoderMethodsCollection class >> ___forFilter: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | GtCoderMethodsFilter typAsType ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderMethodsCollection class >> shadowedClass [
	^ GtCoderMethodsCollection class
]

{ #category : #converting }
TypShaGtGtCoderMethodsCollection >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {CompiledMethod typAsType}
]
