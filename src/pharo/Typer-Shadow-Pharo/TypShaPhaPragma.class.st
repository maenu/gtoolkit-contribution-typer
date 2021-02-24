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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters:
					{{String typAsType.
					Symbol typAsType.
					Number typAsType.
					Boolean typAsType} typAsType})
]

{ #category : #shadow }
TypShaPhaPragma >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
