Class {
	#name : #TypCheManifest,
	#superclass : #PackageManifest,
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheManifest class >> build [
	TypCheIndex instance
]

{ #category : #accessing }
TypCheManifest class >> invalidate [
	TypCheIndex invalidate
]
