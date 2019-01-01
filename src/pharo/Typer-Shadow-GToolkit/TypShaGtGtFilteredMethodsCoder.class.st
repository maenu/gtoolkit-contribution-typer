Class {
	#name : #TypShaGtGtFilteredMethodsCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtFilteredMethodsCoder class >> shadowedClass [
	^ GtFilteredMethodsCoder class
]

{ #category : #accessing }
TypShaGtGtFilteredMethodsCoder >> ___methodAdded: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | ValueAdded typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtFilteredMethodsCoder >> ___newMethodCoderFor: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | CompiledMethod typAsType ];
		resultType: [ :a :s :r | GtMethodCoder typAsType ];
		yourself
]
