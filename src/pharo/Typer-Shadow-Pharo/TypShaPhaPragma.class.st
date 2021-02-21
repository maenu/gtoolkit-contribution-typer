Class {
	#name : #TypShaPhaPragma,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaPragma class >> shadowedClass [
	^ Pragma class
]

{ #category : #shadow }
TypShaPhaPragma >> mArguments: aLookup [ 
	<typShaMethod: 'arguments'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters:
					{{String typAsType.
					Symbol typAsType.
					Number typAsType.
					Boolean typAsType} typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaPragma >> mSelector: aLookup [ 
	<typShaMethod: 'selector'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
