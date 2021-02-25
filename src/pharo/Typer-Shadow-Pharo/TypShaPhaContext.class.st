Class {
	#name : #TypShaPhaContext,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaContext class >> shadowedClass [
	^ Context class
]

{ #category : #shadow }
TypShaPhaContext >> mArguments: aLookup [
	<typShaMethod: 'arguments'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: SequenceableCollection typAsType
]

{ #category : #shadow }
TypShaPhaContext >> mMethod: aLookup [
	<typShaMethod: 'method'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #shadow }
TypShaPhaContext >> mReceiver: aLookup [
	<typShaMethod: 'receiver'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Object typAsType
]
