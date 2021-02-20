Class {
	#name : #TypShaGtGtPhlowExplicitView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowExplicitView class >> shadowedClass [
	^ GtPhlowExplicitView class
]

{ #category : #accessing }
TypShaGtGtPhlowExplicitView >> ___stencil: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: BlElement typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
