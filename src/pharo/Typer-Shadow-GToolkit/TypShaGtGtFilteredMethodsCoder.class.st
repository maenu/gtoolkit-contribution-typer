Class {
	#name : #TypShaGtGtFilteredMethodsCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtFilteredMethodsCoder class >> shadowedClass [
	^ GtFilteredMethodsCoder class
]

{ #category : #shadow }
TypShaGtGtFilteredMethodsCoder >> mMethodAdded: aLookup [
	<typShaMethod: 'methodAdded:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {ValueAdded typAsType}
]

{ #category : #shadow }
TypShaGtGtFilteredMethodsCoder >> mNewMethodCoderFor: aLookup [
	<typShaMethod: 'newMethodCoderFor:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMethodCoder typAsType
		arguments: {CompiledMethod typAsType}
]
