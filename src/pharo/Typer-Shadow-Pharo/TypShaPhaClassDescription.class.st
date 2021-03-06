Class {
	#name : #TypShaPhaClassDescription,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription class >> shadowedClass [
	^ ClassDescription class
]

{ #category : #shadow }
TypShaPhaClassDescription >> mAddInstVarNamed: aLookup [
	<typShaMethod: 'addInstVarNamed:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaClassDescription >> mClassSide: aLookup [
	<typShaMethod: 'classSide'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup receiver classDescription classSide
]

{ #category : #shadow }
TypShaPhaClassDescription >> mHasInstVarNamed: aLookup [
	<typShaMethod: 'hasInstVarNamed:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaClassDescription >> mInstanceSide: aLookup [
	<typShaMethod: 'instanceSide'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsClassSide: aLookup [
	<typShaMethod: 'isClassSide'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsTestCase: aLookup [
	<typShaMethod: 'isTestCase'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
