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
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowExplicitView typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mMondrian: aLookup [
	<typShaMethod: 'mondrian'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowMondrianView typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mPriority: aLookup [
	<typShaMethod: 'priority:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Number typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mTitle: aLookup [
	<typShaMethod: 'title:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]
