Class {
	#name : #TypShaGtGtPhlowProtoView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowProtoView class >> shadowedClass [
	^ GtPhlowProtoView class
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mExplicit: aLookup [
	<typShaMethod: 'explicit'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowExplicitView typAsType
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mMondrian: aLookup [
	<typShaMethod: 'mondrian'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowMondrianView typAsType
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mPriority: aLookup [
	<typShaMethod: 'priority:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Number typAsType}
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mTitle: aLookup [
	<typShaMethod: 'title:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {String typAsType}
]
