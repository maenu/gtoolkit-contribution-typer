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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mTitle: aLookup [
	<typShaMethod: 'title:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]
