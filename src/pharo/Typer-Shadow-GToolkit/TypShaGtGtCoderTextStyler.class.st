Class {
	#name : #TypShaGtGtCoderTextStyler,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtCoderTextStyler class >> mForCoder: aLookup [
	<typShaMethod: 'forCoder:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {GtPharoMethodCoder typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderTextStyler class >> shadowedClass [
	^ GtCoderTextStyler class
]

{ #category : #shadow }
TypShaGtGtCoderTextStyler >> mExtraStyleAst: aLookup [
	<typShaMethod: 'extraStyle:ast:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{BlText typAsType.
			RBMethodNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderTextStyler >> mStyleAst: aLookup [
	<typShaMethod: 'style:ast:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{BlText typAsType.
			RBMethodNode typAsType}
]

{ #category : #accessing }
TypShaGtGtCoderTextStyler >> vCoder: aLookup [
	<typShaForVariable: #coder>
	^ GtPharoMethodCoder typAsType
]
