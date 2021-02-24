Class {
	#name : #TypShaPhaRBMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMessageNode class >> shadowedClass [
	^ RBMessageNode class
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mArguments: aLookup [
	<typShaMethod: 'arguments'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBValueNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mKeywordsIntervals: aLookup [
	<typShaMethod: 'keywordsIntervals'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {(Interval typAsType copyWithParameters: {Integer typAsType})})
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mReceiver: aLookup [
	<typShaMethod: 'receiver'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
