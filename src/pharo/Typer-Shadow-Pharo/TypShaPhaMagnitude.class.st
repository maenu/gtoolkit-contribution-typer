Class {
	#name : #TypShaPhaMagnitude,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMagnitude class >> shadowedClass [
	^ Magnitude class
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary223: aLookup [
	<typShaMethod: '<='>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary225: aLookup [
	<typShaMethod: '>'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #shadow }
TypShaPhaMagnitude >> mBinary226: aLookup [
	<typShaMethod: '<'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #shadow }
TypShaPhaMagnitude >> mMax: aLookup [
	<typShaMethod: 'max:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiver.
			(aLookup arguments at: 1)} typAsType
		arguments: {Magnitude typAsType}
]
