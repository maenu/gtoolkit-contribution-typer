Class {
	#name : #TypShaPhaMonitor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMonitor class >> shadowedClass [
	^ Monitor class
]

{ #category : #shadow }
TypShaPhaMonitor >> mCritical: aLookup [
	<typShaMethod: 'critical:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result
		arguments: {BlockClosure typAsType}
]
