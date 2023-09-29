Class {
	#name : #TypGtManifest,
	#superclass : #PackageManifest,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtManifest class >> groupedExtensionMethods [
	^ (self package extensionMethods
		groupedBy: [ :m | 
			{#typGtPra.
				#typGtSha.
				#typGtChe.
				#typGtCov} detect: [ :s | m selector beginsWith: s ] ifNone: [ #typGt ] ])
		collect: [ :c | 
			c
				sorted: [ :a :b | 
					a methodClass name = b methodClass name
						ifTrue: [ a selector < b selector ]
						ifFalse: [ a methodClass name < b methodClass name ] ] ]
]
