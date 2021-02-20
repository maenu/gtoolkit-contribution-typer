Class {
	#name : #TypShaGtGtPhlowView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowView class >> shadowedClass [
	^ GtPhlowView class
]

{ #category : #accessing }
TypShaGtGtPhlowView >> ___actionStencil: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: BlElement typAsType
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
